-- Adari - Baituh City
-- Last saved Thursday 26-Nov-2020 15:24:24

AreaEntry
{
   HighEconomy = 0, 
   Objects = 
   {
      [29060] = 
      {
         Layers = 0, 
         Description = "A Large sign has been posted here.", 
         ShortDescr = "a sign", 
         Weight = 5000, 
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
         Cost = 1, 
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
         Vnum = 29060, 
         ActionDescription = "", 
         Tag = "", 
         Name = "sign welcome", 
      }, 
      [29061] = 
      {
         Layers = 0, 
         Description = "A Bail Box has been built into the wall.", 
         ShortDescr = "a Bail Box", 
         Weight = 5000, 
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
         Cost = 0, 
         ItemType = "container", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "sorry", 
               Code = "mpgoto 29103\
mptransfer $n\
mpechoat $n The doors opens and you are released.\
mpecho $n exits the jail.\
mpgoto 29108\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "bribe_prog", 
               Arguments = "30", 
               Code = "mpgoto 29103\
mptransfer $n\
mpechoat $n The doors opens and you are released.\
mpecho $n exits the jail.\
mpgoto 29108\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
            [0] = 500, 
         }, 
         Vnum = 29061, 
         ActionDescription = "", 
         Tag = "", 
         Name = "bail box", 
      }, 
      [29065] = 
      {
         Layers = 0, 
         Description = "A copy of PlayHutt magazine has been left here.", 
         ShortDescr = "a copy of PlayHutt magazine", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "playhutt trashy magazine", 
               Description = "Be careful! You might go blind looking at such filth!\
\13", 
            }, 
         }, 
         Cost = 50, 
         ItemType = "smut", 
         Weight = 2, 
         Flags = 
         {
            [4] = "Contraband", 
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
         Vnum = 29065, 
         ActionDescription = "", 
         Tag = "", 
         Name = "playhutt trashy magazine", 
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
         Last = 29065, 
         First = 29060, 
      }, 
      Mob = 
      {
         Last = 29070, 
         First = 29060, 
      }, 
      Room = 
      {
         Last = 29158, 
         First = 29060, 
      }, 
   }, 
   ResetMessage = "", 
   ResetFrequency = 0, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 29068, 
         Arg1 = 29061, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         Arg3 = 0, 
         Arg1 = 29002, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         Arg3 = 0, 
         Arg1 = 10313, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         Arg3 = 0, 
         Arg1 = 10314, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         Arg3 = 0, 
         Arg1 = 10317, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         Arg3 = 29083, 
         Arg1 = 29062, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [7] = 
      {
         Arg3 = 29084, 
         Arg1 = 29063, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         Arg3 = 2, 
         Arg1 = 29084, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
      }, 
      [9] = 
      {
         Arg3 = 29081, 
         Arg1 = 29065, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         Arg3 = 2, 
         Arg1 = 29081, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
      }, 
      [11] = 
      {
         Arg3 = 29108, 
         Arg1 = 29066, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         Arg3 = 2, 
         Arg1 = 29108, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
      }, 
      [13] = 
      {
         Arg3 = 29096, 
         Arg1 = 38, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [14] = 
      {
         Arg3 = 29066, 
         Arg1 = 29067, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [15] = 
      {
         Arg3 = 16, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [16] = 
      {
         Arg3 = 5, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [17] = 
      {
         Arg3 = 7, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [18] = 
      {
         Arg3 = 8, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [19] = 
      {
         Arg3 = 29069, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [20] = 
      {
         Arg3 = 5, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [21] = 
      {
         Arg3 = 7, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [22] = 
      {
         Arg3 = 8, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [23] = 
      {
         Arg3 = 16, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [24] = 
      {
         Arg3 = 29078, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [25] = 
      {
         Arg3 = 7, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [26] = 
      {
         Arg3 = 8, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [27] = 
      {
         Arg3 = 5, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [28] = 
      {
         Arg3 = 16, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [29] = 
      {
         Arg3 = 29090, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
      }, 
      [30] = 
      {
         Arg3 = 5, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [31] = 
      {
         Arg3 = 7, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [32] = 
      {
         Arg3 = 8, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [33] = 
      {
         Arg3 = 16, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [34] = 
      {
         Arg3 = 29100, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
      }, 
      [35] = 
      {
         Arg3 = 5, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [36] = 
      {
         Arg3 = 7, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [37] = 
      {
         Arg3 = 8, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [38] = 
      {
         Arg3 = 16, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [39] = 
      {
         Arg3 = 29106, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
      }, 
      [40] = 
      {
         Arg3 = 5, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [41] = 
      {
         Arg3 = 7, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [42] = 
      {
         Arg3 = 8, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [43] = 
      {
         Arg3 = 16, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [44] = 
      {
         Arg3 = 29107, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 6, 
      }, 
      [45] = 
      {
         Arg3 = 5, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [46] = 
      {
         Arg3 = 7, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [47] = 
      {
         Arg3 = 8, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [48] = 
      {
         Arg3 = 16, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [49] = 
      {
         Arg3 = 29065, 
         Arg1 = 29060, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [50] = 
      {
         Arg3 = 8, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [51] = 
      {
         Arg3 = 7, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [52] = 
      {
         Arg3 = 16, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [53] = 
      {
         Arg3 = 5, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [54] = 
      {
         Arg3 = 29065, 
         Arg1 = 29060, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [55] = 
      {
         Arg3 = 29062, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [56] = 
      {
         Arg3 = 12, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [57] = 
      {
         Arg3 = 29071, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [58] = 
      {
         Arg3 = 12, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [59] = 
      {
         Arg3 = 29080, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
      }, 
      [60] = 
      {
         Arg3 = 12, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [61] = 
      {
         Arg3 = 29073, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
      }, 
      [62] = 
      {
         Arg3 = 12, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [63] = 
      {
         Arg3 = 29092, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
      }, 
      [64] = 
      {
         Arg3 = 12, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [65] = 
      {
         Arg3 = 29104, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 6, 
      }, 
      [66] = 
      {
         Arg3 = 12, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [67] = 
      {
         Arg3 = 29127, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [68] = 
      {
         Arg3 = 29129, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [69] = 
      {
         Arg3 = 29131, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
      }, 
      [70] = 
      {
         Arg3 = 29133, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
      }, 
      [71] = 
      {
         Arg3 = 29135, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
      }, 
      [72] = 
      {
         Arg3 = 29137, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 6, 
      }, 
      [73] = 
      {
         Arg3 = 29139, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 7, 
      }, 
      [74] = 
      {
         Arg3 = 29141, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 8, 
      }, 
      [75] = 
      {
         Arg3 = 29143, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 9, 
      }, 
      [76] = 
      {
         Arg3 = 29145, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [77] = 
      {
         Arg3 = 29147, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 11, 
      }, 
      [78] = 
      {
         Arg3 = 29149, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [79] = 
      {
         Arg3 = 29151, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [80] = 
      {
         Arg3 = 29153, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 14, 
      }, 
      [81] = 
      {
         Arg3 = 29155, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 15, 
      }, 
      [82] = 
      {
         Arg3 = 29157, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 16, 
      }, 
      [83] = 
      {
         Arg3 = 29115, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 17, 
      }, 
      [84] = 
      {
         Arg3 = 29119, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 18, 
      }, 
      [85] = 
      {
         Arg3 = 2, 
         Arg1 = 29027, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
      }, 
      [86] = 
      {
         Arg3 = 29027, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 7, 
      }, 
      [87] = 
      {
         Arg3 = 8, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [88] = 
      {
         Arg3 = 7, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [89] = 
      {
         Arg3 = 5, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [90] = 
      {
         Arg3 = 16, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [91] = 
      {
         Arg3 = 2, 
         Arg1 = 29027, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
      }, 
      [92] = 
      {
         Arg3 = 29015, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 8, 
      }, 
      [93] = 
      {
         Arg3 = 8, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [94] = 
      {
         Arg3 = 7, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [95] = 
      {
         Arg3 = 5, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [96] = 
      {
         Arg3 = 16, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [97] = 
      {
         Arg3 = 29015, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 7, 
      }, 
      [98] = 
      {
         Arg3 = 12, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [99] = 
      {
         Arg3 = 29021, 
         Arg1 = 29007, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 9, 
      }, 
      [100] = 
      {
         Arg3 = 29021, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 8, 
      }, 
      [101] = 
      {
         Arg3 = 12, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [102] = 
      {
         Arg3 = 29033, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 9, 
      }, 
      [103] = 
      {
         Arg3 = 12, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [104] = 
      {
         Arg3 = 29037, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [105] = 
      {
         Arg3 = 12, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [106] = 
      {
         Arg3 = 29042, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 11, 
      }, 
      [107] = 
      {
         Arg3 = 12, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [108] = 
      {
         Arg3 = 29041, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [109] = 
      {
         Arg3 = 12, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [110] = 
      {
         Arg3 = 29050, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [111] = 
      {
         Arg3 = 12, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [112] = 
      {
         Arg3 = 29064, 
         Arg1 = 29007, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [113] = 
      {
         Arg3 = 29088, 
         Arg1 = 29007, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 11, 
      }, 
      [114] = 
      {
         Arg3 = 29082, 
         Arg1 = 29007, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [115] = 
      {
         Arg3 = 29101, 
         Arg1 = 29007, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [116] = 
      {
         Arg3 = 29085, 
         Arg1 = 29064, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [117] = 
      {
         Arg3 = 0, 
         Arg1 = 21009, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [118] = 
      {
         Arg3 = 0, 
         Arg1 = 21008, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [119] = 
      {
         Arg3 = 0, 
         Arg1 = 21010, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [120] = 
      {
         Arg3 = 0, 
         Arg1 = 32230, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [121] = 
      {
         Arg3 = 0, 
         Arg1 = 10487, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [122] = 
      {
         Arg3 = 0, 
         Arg1 = 29065, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [123] = 
      {
         Arg3 = 29085, 
         Arg1 = 7316, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [124] = 
      {
         Arg3 = 16, 
         Arg1 = 28200, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [125] = 
      {
         Arg3 = 6, 
         Arg1 = 32217, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [126] = 
      {
         Arg3 = 5, 
         Arg1 = 32215, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [127] = 
      {
         Arg3 = 7, 
         Arg1 = 32216, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [128] = 
      {
         Arg3 = 13, 
         Arg1 = 32204, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [129] = 
      {
         Arg3 = 8, 
         Arg1 = 32205, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [130] = 
      {
         Arg3 = 0, 
         Arg1 = 29085, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
      }, 
   }, 
   Author = "Merth", 
   Rooms = 
   {
      [29060] = 
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
         Vnum = 29060, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [29061] = 
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
            [13] = "Arena", 
            [2] = "NoMob", 
            [7] = "NoMagic", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29112, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29062, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29061, 
         Description = "This is the northern most entrance and exit of Baituh City.  Jagged\
rocks prevent your travel in most directions.  The air is thick and\
full of dirt and soil.  You can continue to either the north or the\
south from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29062] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29061, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29064, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29063, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29062, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29063] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29062, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29066, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29063, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29064] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29067, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29062, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29064, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29065] = 
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
            [2] = "NoMob", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29066, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29065, 
         Description = "This barren little area is used for private space vessels to come\
and go.  This is not a nice or well kept facility, but it does serve\
a very useful purpose for the cities inhabitants.  This is not a bus\
stop. Commercial transportation does not and cannot dock here.  You\
can continue east from here.\
", 
         Tag = "", 
         Name = "Baituh City Landing Strip", 
      }, 
      [29066] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29063, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29069, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29065, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29066, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29067] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29064, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29068, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29071, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29067, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29068] = 
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
            [13] = "Arena", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29067, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29068, 
         Description = "You are just inside a cave.  The room is very well lit and well\
kept. Whoever runs the shop is very clean and meticulous.  The floor\
is made up of smoothed marble like rock and has very little dirt on\
it. You can exit to the west.\
", 
         Tag = "", 
         Name = "Baituh City Cafeteria", 
      }, 
      [29069] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29066, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29070, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29069, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29070] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29071, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29072, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29069, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29070, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29071] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29067, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29070, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29071, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29072] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29070, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29073, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29072, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue north or south\
from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29073] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29072, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29086, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29098, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29074, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29073, 
         Description = "This is the main intersection for Baituh City.  There are city\
blocks in all directions from here.  Each direction leads to\
something completely different than the other three.  Feel free to\
look around.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29074] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29073, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29075, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29074, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue east or west from\
here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29075] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29076, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29074, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29082, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29075, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29076] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29075, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29077, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29076, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29077] = 
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
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29083, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29076, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29078, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29077, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29078] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29077, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29079, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29078, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29079] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29078, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29080, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29084, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29079, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29080] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29079, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29081, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29080, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29081] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29082, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29085, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29080, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29081, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh City\
is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here. To the south is a 'bar'.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29082] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29075, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29081, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29082, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29083] = 
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
               Direction = "south", 
               DestinationVnum = 29077, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29083, 
         Description = "At one time Baituh City produced the best and brightest Adarians in\
their state of the art academy.  Since the planet and town have hit\
hard times, things have changed.  Now students must travel to Alfuh\
to work on their fighting skills. Most of the faculty from the old\
school have also left.  This lone room now acts as a tutoring\
facility for the one remaining faculty member.\
", 
         Tag = "", 
         Name = "Baituh City Academia", 
      }, 
      [29084] = 
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
            [15] = "NoDropAll", 
            [13] = "Arena", 
            [10] = "Safe", 
            [7] = "NoMagic", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29079, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29110, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29084, 
         Description = "Welcome to the Baituh City Inn.  Those who need to rest and such\
can do so here.  But, you have to purchase a room of course.  This is\
not the largest hotel on the planet by any means.  But if you need to\
rest, this place is as good as any other.  You can exit to the east.\
", 
         Tag = "", 
         Name = "Baituh City Inn", 
      }, 
      [29085] = 
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
            [13] = "Arena", 
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
               Direction = "north", 
               DestinationVnum = 29081, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29085, 
         Description = "This dank fouls smelling hole in the ground is one of the few\
businesses able to survive these times of hardship.  It is a bar. \
Beings come here to forget about how miserable their lives are.  Feel\
free to join them.  But watch your step.  You can exit to the north.\
", 
         Tag = "", 
         Name = "Baituh City Bar", 
      }, 
      [29086] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29087, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29073, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29086, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue east or west from\
here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29087] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29088, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29094, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29086, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29087, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29088] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29089, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29087, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29088, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29089] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29095, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29090, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29088, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29089, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29090] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29091, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29089, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29090, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29091] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29090, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29096, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29092, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29091, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29092] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29091, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29093, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29092, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29093] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29092, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29097, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29094, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29093, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29094] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29087, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29093, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29094, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29095] = 
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
            [13] = "Arena", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29089, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29095, 
         Description = "This is not quite as elegant as one would expect of a government.\
 It would seem the government has been struggling a lot too during\
this time of hardship for the planet.  The room is well lit.  The\
walls are covered in dirt and filth, the floor is even worse.  You\
can escape to the south.\
", 
         Tag = "", 
         Name = "Baituh City Governmental Offices", 
      }, 
      [29096] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29091, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29096, 
         Description = "Baituh City is still capable of communicating with other cities and\
planets. This was once a thriving postal service serving Baituh City\
and its the suburbs. Today, no one oversees the post office.  It is\
all done electronically.  You can exit to the west.\
", 
         Tag = "", 
         Name = "Baituh City Post Office", 
      }, 
      [29097] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29093, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "If you go south, you will surely die!\
", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29111, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29097, 
         Description = "It is extremely warm here.  There is a large pool of lava\
directly south of here.  To continue south would almost certainly be\
instant death.  It would be best to get as far away from here as\
possible.  This is not a safe area.  Go north if you cherish life.\
", 
         Tag = "", 
         Name = "Lava Resevoir", 
      }, 
      [29098] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29073, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29099, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29098, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue north or south\
from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29099] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29098, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29101, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29100, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29099, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29100] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29099, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29102, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29100, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29101] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29103, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29099, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29101, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29102] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29100, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29104, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29107, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29102, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29103] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29101, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [26] = "CanLook", 
                  [10] = "NoPassdoor", 
                  [23] = "BashProof", 
               }, 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29108, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29106, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29103, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29104] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29102, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29105, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29104, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29105] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29106, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29109, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29104, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29105, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29106] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29103, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29105, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29106, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29107] = 
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
               DestinationVnum = 29102, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29107, 
         Description = "This is the Baituh City Police Station.  A large marble desk sits in\
the corner of the room.  The floor is covered in dirt and volcanic\
ash. Several communication terminals have been built into the walls\
around you.\
", 
         Tag = "", 
         Name = "Baituh City Police Station", 
      }, 
      [29108] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
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
         TeleDelay = 0, 
         Flags = 
         {
            [15] = "NoDropAll", 
            [13] = "Arena", 
            [6] = "NoDrive", 
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
                  [26] = "CanLook", 
                  [10] = "NoPassdoor", 
                  [23] = "BashProof", 
               }, 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29103, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29108, 
         Description = "This is a dank foul smelling armpit of a cell.  To be locked in this\
room means you must have broken the law.  Thick rocks make up the\
walls and ceiling. \
", 
         Tag = "", 
         Name = "Baituh City Jail", 
      }, 
      [29109] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29105, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29109, 
         Description = "This road is very wide and seems to be in fairly decent condition. \
However, a large rock-like boulder blocks you from continuing any\
further south. \
", 
         Tag = "", 
         Name = "Baituh City Road", 
      }, 
      [29110] = 
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
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29084, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29110, 
         Description = "This is where you can safely sleep and exit the game.  When you\
reenter the game, this is the room you will start in.  Be sure to\
thank the hotel staff for putting up with you.  Enjoy your stay.  You\
can exit to the east. \
", 
         Tag = "", 
         Name = "Baituh City Hotel", 
      }, 
      [29111] = 
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
            [16] = "Silence", 
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29097, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29111, 
         Description = "It is unbelievably hot here.  You are in a lake of lava.  To be\
here is  almost certainly suicide.  If you can still escape to the\
north, do so! \
", 
         Tag = "", 
         Name = "Lava Lake", 
      }, 
      [29112] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29158, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29061, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29113, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29112, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.  To the south is Baituh\
City.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29113] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29112, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29114, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29113, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29114] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29115, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29113, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29114, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29115] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29116, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29114, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29115, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29116] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29117, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29115, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29116, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29117] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29118, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29116, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29117, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29118] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29119, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29117, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29118, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29119] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29120, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29118, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29119, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29120] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29121, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29119, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29120, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29121] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29122, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29120, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29121, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29122] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29123, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29121, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29122, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29123] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29124, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29125, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29122, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29123, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29124] = 
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
            [13] = "Arena", 
            [2] = "NoMob", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29049, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29123, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29124, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Outskirts of Alfuh City", 
      }, 
      [29125] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29126, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29123, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29125, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here. \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29126] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29127, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29125, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29126, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29127] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29130, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29128, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29126, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29127, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29128] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29127, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29129, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29128, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29129] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29128, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29130, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29129, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29130] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29129, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29131, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29130, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29131] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29130, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29132, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29138, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29131, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29132] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29131, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29133, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29128, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29132, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29133] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29134, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29132, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29133, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29134] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29140, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29135, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29128, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29133, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29134, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29135] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29136, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29134, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29135, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29136] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29143, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29131, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29137, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29135, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29136, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29137] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29136, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29132, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29138, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29137, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29138] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29137, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29139, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29138, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29139] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29138, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29140, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29139, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29140] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29139, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29136, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29141, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29140, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29141] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29140, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29142, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29141, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29142] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29141, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29143, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29136, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29142, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29143] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29142, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29139, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29144, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29143, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29144] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29143, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29145, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29144, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29145] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29146, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29144, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29145, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29146] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29147, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29145, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29146, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29147] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29148, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29146, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29147, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29148] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29151, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29149, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29147, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29148, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29149] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29139, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29150, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29148, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29149, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29150] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29149, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29151, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29150, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29151] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29152, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29150, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29151, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29152] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29151, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29147, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29153, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29152, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29153] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29152, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29154, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29153, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29154] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29155, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29153, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29154, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29155] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29154, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29156, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29155, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29156] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29155, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 29157, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29156, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29157] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 29156, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29147, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29158, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29157, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
      [29158] = 
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
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 29157, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 29112, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 29158, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         Tag = "", 
         Name = "Enclosed Dirt Path", 
      }, 
   }, 
   FileFormatVersion = 1, 
   Filename = "adari01.lua", 
   Mobiles = 
   {
      [29060] = 
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
         Race = "Adarian", 
         Alignment = 350, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         NumberOfAttacks = 0, 
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
               Arguments = "12", 
               Code = "mpecho A deputy leaves in a rush.\
mpgoto 29030\
drop all\
mpgoto 29065\
mpecho A deputy has arrived.\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         DamRoll = 8, 
         Description = "He is a big burly Adarian.  His only intention is to keep weapons\
from being imported or exported from Adari.\
", 
         ShortDescr = "Smotsuk", 
         Weight = 0, 
         HitRoll = 8, 
         Sex = "male", 
         LongDescr = "Smotsuk, a customs officer is here.\
", 
         HitChance = 
         {
            HitNoDice = 4, 
            HitSizeDice = 40, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 40, 
         Damage = 
         {
            DamSizeDice = 20, 
            DamNoDice = 4, 
            DamPlus = 0, 
         }, 
         Vnum = 29060, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "officer customs smotsuk", 
      }, 
      [29061] = 
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
         Race = "Adarian", 
         Alignment = -400, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         NumberOfAttacks = 0, 
         DamRoll = 4, 
         Languages = 
         {
            Speaks = 
            {
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "Baszturd", 
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
         Description = "He is an elderly Adarian shop keeper. \
", 
         ShortDescr = "Baszturd", 
         Weight = 0, 
         HitRoll = 4, 
         Sex = "male", 
         LongDescr = "A shop keeper works here.\
", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 20, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 20, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 2, 
            DamPlus = 0, 
         }, 
         Vnum = 29061, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "shop keeper shopkeeper baszturd", 
      }, 
      [29062] = 
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
         Race = "Adarian", 
         Alignment = 450, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [6] = "StayArea", 
            [20] = "Scholar", 
         }, 
         NumberOfAttacks = 0, 
         Languages = 
         {
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
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         DamRoll = 4, 
         Description = "This old Adarian may not know a great deal about fighting, but he\
knows many languages and other academic fields.  He might be able to\
help you learn another language. \
", 
         ShortDescr = "Professor Sumaretie", 
         Weight = 0, 
         HitRoll = 4, 
         Sex = "male", 
         LongDescr = "A saavy, old scholar studies here.\
", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 20, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 20, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 2, 
            DamPlus = 0, 
         }, 
         Vnum = 29062, 
         ArmorClass = 60, 
         Tag = "", 
         Name = "scholar old saavy professor sumaretie", 
      }, 
      [29063] = 
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
         Race = "Adarian", 
         Alignment = -400, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "75", 
               Code = "mpecho A little red R2 Unit whistles happily towards you.\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "bribe_prog", 
               Arguments = "18", 
               Code = "mpgoto 29110\
mptransfer $n\
mpechoat $n The R2 Unit escorts you to a room.\
east\
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
               [19] = "adarese", 
            }, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         DamRoll = 6, 
         Description = "A red astromech R2 unit idles here waiting to help you.  If you would\
like  to rent a room for the evening, give 50 credits to this R2\
unit. \
", 
         ShortDescr = "An Innkeeper Droid", 
         Weight = 0, 
         HitRoll = 6, 
         Sex = "undistinguished", 
         LongDescr = "An Innkeeper Droid idles here.\
", 
         HitChance = 
         {
            HitNoDice = 3, 
            HitSizeDice = 30, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 30, 
         Damage = 
         {
            DamSizeDice = 15, 
            DamNoDice = 3, 
            DamPlus = 0, 
         }, 
         Vnum = 29063, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "droid innkeeper keeper r2 unit", 
      }, 
      [29064] = 
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
         Race = "Hutt", 
         Alignment = -500, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         NumberOfAttacks = 0, 
         DamRoll = 10, 
         Languages = 
         {
            Speaks = 
            {
               [4] = "huttese", 
               [0] = "basic", 
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         Shop = 
         {
            KeeperShortDescr = "Puttzu", 
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
         ShortDescr = "Puttzu", 
         Weight = 0, 
         HitRoll = 10, 
         Sex = "male", 
         LongDescr = "A Hutt Bartender works here.\
", 
         HitChance = 
         {
            HitNoDice = 5, 
            HitSizeDice = 50, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 50, 
         Damage = 
         {
            DamSizeDice = 25, 
            DamNoDice = 5, 
            DamPlus = 0, 
         }, 
         Vnum = 29064, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "bartender hutt puttzu", 
      }, 
      [29065] = 
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
         Race = "Adarian", 
         Alignment = -500, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [26] = "Droid", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "p hutts rule!", 
               Code = "mpgoto puttzu\
mptransfer $n\
mpechoat $n The Droid ushers you into the bar.\
mpecho $n is ushered into the bar.\
mpgoto 29081\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         DamRoll = 13, 
         Description = "This Astromech Droid is acting as a bouncer to the bar south of here.\
Only 'adults' can enter.  If you would like to enter the bar, tell\
the droid 'hutts rule!'. \
", 
         ShortDescr = "An Astromech Droid", 
         Weight = 0, 
         HitRoll = 13, 
         Sex = "undistinguished", 
         LongDescr = "An Astromech Droid acts as a bouncer here.\
", 
         HitChance = 
         {
            HitNoDice = 7, 
            HitSizeDice = 65, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 65, 
         Damage = 
         {
            DamSizeDice = 37, 
            DamNoDice = 6, 
            DamPlus = 0, 
         }, 
         Vnum = 29065, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "droid astromech bouncer", 
      }, 
      [29066] = 
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
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "bribe_prog", 
               Arguments = "30", 
               Code = "mpechoaround $n $n exits the jail.\
mpgoto 29103\
mptransfer $n\
mpechoat $n The doors opens and you are released.\
mpechoaround $n $n exits the jail.\
mpgoto 29108\
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
         DamRoll = 10, 
         Description = "", 
         ShortDescr = "a bail box", 
         Weight = 0, 
         HitRoll = 10, 
         Sex = "undistinguished", 
         LongDescr = "A Bail Box has been installed in the wall here.\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 50, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 29066, 
         ArmorClass = -100, 
         Tag = "", 
         Name = "bailjfk boxjfk", 
      }, 
      [29067] = 
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
         Race = "Adarian", 
         Alignment = 300, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [6] = "StayArea", 
         }, 
         NumberOfAttacks = 0, 
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
               Arguments = "50", 
               Code = "mpecho Deputy Snopaew surveys the area.\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "75", 
               Code = "glare $n\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         DamRoll = 6, 
         Description = "Deputy Snopaew is a tall and gangly looking Adarian.  It is his job to\
keep weapons out of the city.\
", 
         ShortDescr = "Deputy Snopaew", 
         Weight = 0, 
         HitRoll = 6, 
         Sex = "male", 
         LongDescr = "A deputy partols the area.\
", 
         HitChance = 
         {
            HitNoDice = 3, 
            HitSizeDice = 30, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 30, 
         Damage = 
         {
            DamSizeDice = 15, 
            DamNoDice = 3, 
            DamPlus = 0, 
         }, 
         Vnum = 29067, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "deputy snopaew", 
      }, 
      [29068] = 
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
         Race = "Adarian", 
         Alignment = 300, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         NumberOfAttacks = 0, 
         SpecFuns = 
         {
            [1] = "spec_customs_alcohol", 
            [0] = "spec_police_attack", 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         DamRoll = 3, 
         Description = "A young Adarian deputy.  You can see it is his dream to enforce\
laws.  He is a decent and moral being.\
", 
         ShortDescr = "a young deputy", 
         Weight = 0, 
         HitRoll = 3, 
         Sex = "male", 
         LongDescr = "A deputy patrols the area.\
", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 15, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 15, 
         Level = 15, 
         Damage = 
         {
            DamSizeDice = 8, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Vnum = 29068, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "deputy young", 
      }, 
      [29069] = 
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
         Race = "Adarian", 
         Alignment = -100, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         DamRoll = 2, 
         Description = "Not the brightest nor most beautiful Adarian.  This is one of the\
citizens of the town.  She lives day to day.\
", 
         ShortDescr = "a Townie", 
         Weight = 0, 
         HitRoll = 2, 
         Sex = "female", 
         LongDescr = "An Adarian Townie wanders about here.\
", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 10, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 15, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Vnum = 29069, 
         ArmorClass = 75, 
         Tag = "", 
         Name = "adarian townie", 
      }, 
      [29070] = 
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
         Race = "Adarian", 
         Alignment = -100, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
            [18] = "Mountable", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "75", 
               Code = "if ispc($n) \
if level($n) >= 15 \
mpkill $n \
endif \
else \
mpecho A Draagax snorts loudly.\
endif\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         DamRoll = 4, 
         Description = "Ears similar to a rabbit, eyes of a fly, teeth of a lion, body of an\
ape. This can be a very frightening beast to stumble upon.\
", 
         ShortDescr = "a Draagax", 
         Weight = 0, 
         HitRoll = 4, 
         Sex = "undistinguished", 
         LongDescr = "A crazed omnivore sniffs about.\
", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 22, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 22, 
         Damage = 
         {
            DamSizeDice = 12, 
            DamNoDice = 2, 
            DamPlus = 0, 
         }, 
         Vnum = 29070, 
         ArmorClass = 65, 
         Tag = "", 
         Name = "draagax crazed omnivore", 
      }, 
   }, 
   LowEconomy = 4998856, 
   Name = "Adari - Baituh City", 
}
