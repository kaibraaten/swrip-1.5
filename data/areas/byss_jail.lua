-- Byss Prison
-- Last saved Sunday 31-May-2020 15:51:33

AreaEntry
{
   ResetMessage = "", 
   Filename = "byss_jail.lua", 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 9099, 
         First = 9050, 
      }, 
      Room = 
      {
         Last = 9099, 
         First = 9050, 
      }, 
      Object = 
      {
         Last = 9099, 
         First = 9050, 
      }, 
   }, 
   Name = "Byss Prison", 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         Arg1 = 9099, 
         Arg2 = 1, 
         Arg3 = 9099, 
         MiscData = 1, 
      }, 
   }, 
   Rooms = 
   {
      [9050] = 
      {
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9050, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [9099] = 
      {
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9099, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
   }, 
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
         High = 0, 
      }, 
   }, 
   Author = "Durga", 
   Mobiles = 
   {
      [9050] = 
      {
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created dude here.\
", 
         Name = "dude", 
         Vnum = 9050, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
         Race = "Human", 
         Alignment = 0, 
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
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Charisma = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         ShortDescr = "a newly created dude", 
         Level = 1, 
         Description = "", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
      }, 
      [9099] = 
      {
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created dude here.\
", 
         Name = "dude", 
         Vnum = 9099, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
         Race = "Human", 
         Alignment = 0, 
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
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Charisma = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         ShortDescr = "a newly created dude", 
         Level = 1, 
         Description = "", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
      }, 
   }, 
   FileFormatVersion = 1, 
   HighEconomy = 0, 
   Objects = 
   {
      [9099] = 
      {
         Cost = 0, 
         Name = "dud", 
         ItemType = "trash", 
         Vnum = 9099, 
         ShortDescr = "a dud", 
         Layers = 0, 
         Description = "A dud is here.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
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
      [9050] = 
      {
         Cost = 0, 
         Name = "dud", 
         ItemType = "trash", 
         Vnum = 9050, 
         ShortDescr = "a dud", 
         Layers = 0, 
         Description = "A dud is here.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
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
      [9051] = 
      {
         Cost = 0, 
         Name = "dud", 
         ItemType = "trash", 
         Vnum = 9051, 
         ShortDescr = "a dud", 
         Layers = 0, 
         Description = "A dud is here.", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
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
   LowEconomy = 6250000, 
   ResetFrequency = 0, 
}
