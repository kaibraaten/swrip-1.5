-- Byss Prison
-- Last saved Thursday 09-Jul-2020 23:19:12

AreaEntry
{
   Rooms = 
   {
      [9050] = 
      {
         TeleDelay = 0, 
         Vnum = 9050, 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [9099] = 
      {
         TeleDelay = 0, 
         Vnum = 9099, 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
   }, 
   Author = "Durga", 
   ResetFrequency = 0, 
   Name = "Byss Prison", 
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
   HighEconomy = 0, 
   FileFormatVersion = 1, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 9099, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 9099, 
      }, 
   }, 
   Filename = "byss_jail.lua", 
   Objects = 
   {
      [9099] = 
      {
         Vnum = 9099, 
         Weight = 1, 
         Name = "dud", 
         Cost = 0, 
         Description = "A dud is here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "trash", 
         ShortDescr = "a dud", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [9050] = 
      {
         Vnum = 9050, 
         Weight = 1, 
         Name = "dud", 
         Cost = 0, 
         Description = "A dud is here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "trash", 
         ShortDescr = "a dud", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [9051] = 
      {
         Vnum = 9051, 
         Weight = 1, 
         Name = "dud", 
         Cost = 0, 
         Description = "A dud is here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "trash", 
         ShortDescr = "a dud", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
   }, 
   Mobiles = 
   {
      [9050] = 
      {
         Weight = 0, 
         Name = "dude", 
         ArmorClass = 0, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created dude here.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 9050, 
         ShortDescr = "a newly created dude", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [9099] = 
      {
         Weight = 0, 
         Name = "dude", 
         ArmorClass = 0, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created dude here.\
", 
         NumberOfAttacks = 0, 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 9099, 
         ShortDescr = "a newly created dude", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
   }, 
   LowEconomy = 6250000, 
   ResetMessage = "", 
   VnumRanges = 
   {
      Object = 
      {
         First = 9050, 
         Last = 9099, 
      }, 
      Mob = 
      {
         First = 9050, 
         Last = 9099, 
      }, 
      Room = 
      {
         First = 9050, 
         Last = 9099, 
      }, 
   }, 
}
